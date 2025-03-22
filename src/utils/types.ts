// Only ChatGPT | Michigan TypeScript could defeat this shit 
export type DeepReadonly<T> = {
    readonly [K in keyof T]: T[K] extends (...args: any[]) => any
        ? T[K]
        : T[K] extends object
        ? DeepReadonly<T[K]>
        : T[K]
}