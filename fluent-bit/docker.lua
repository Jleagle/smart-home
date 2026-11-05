-- Maps a container ID (from the log file path) to its name and compose
-- service by reading the container's config.v2.json. Cached per ID; a
-- recreated container gets a new ID, so entries never go stale.
local cache = {}

local function lookup(id)
    if cache[id] then
        return cache[id]
    end

    local info = { name = id:sub(1, 12), service = "" }
    local f = io.open("/var/lib/docker/containers/" .. id .. "/config.v2.json", "r")
    if f then
        local cfg = f:read("*a")
        f:close()
        info.name = cfg:match('"Name":"/([^"]+)"') or info.name
        info.service = cfg:match('"com%.docker%.compose%.service":"([^"]+)"') or ""
    end

    cache[id] = info
    return info
end

function enrich(tag, timestamp, record)
    local id = record["filepath"] and record["filepath"]:match("/containers/(%x+)/")
    record["filepath"] = nil
    if not id then
        return 0, timestamp, record
    end

    if type(record["log"]) == "string" then
        record["log"] = record["log"]:gsub("\n$", "")
    end

    local info = lookup(id)
    record["container_name"] = info.name
    record["container_id"] = id:sub(1, 12)

    record["logging.googleapis.com/logName"] = info.name
    record["logging.googleapis.com/labels"] = {
        container = info.name,
        compose_service = info.service,
        stream = record["stream"] or "",
    }
    if record["stream"] == "stderr" then
        record["logging.googleapis.com/severity"] = "WARNING"
    end

    return 2, timestamp, record
end
