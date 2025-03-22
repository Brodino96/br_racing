import Config from "./config"

export class Logger {
    public error(txt: string, bypass?: boolean) {
        if (Config.debugMode || bypass) {
            console.log(`[ERROR] ${txt}`)
        }
    }
    public success(txt: string, bypass?: boolean) {
        if (Config.debugMode || bypass) {
            console.log(`[SUCCESS] ${txt}`)
        }
    }
    public info(txt: string, bypass?: boolean) {
        if (Config.debugMode || bypass) {
            console.log(`[INFO] ${txt}`)
        }
    }
    public warn(txt: string, bypass?: boolean) {
        if (Config.debugMode || bypass) {
            console.log(`[WARNING] ${txt}`)
        }
    }
}