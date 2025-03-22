import type { DeepReadonly } from "./types"

type ConfigType = DeepReadonly<{
    debugMode: boolean,
    locale: string
}>

//@ts-ignore
const jsonData = LoadResourceFile(GetCurrentResourceName(), "/config.json")
const Config: ConfigType = JSON.parse(jsonData)
export default Config