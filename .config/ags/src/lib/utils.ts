import { execAsync } from "ags/process";

export async function bash(
    strings: TemplateStringsArray | string,
    ...values: unknown[]
): Promise<string> {
    const cmd = typeof strings === "string"
        ? strings
        : strings.flatMap((str, i) => str + `${values[i] ?? ""}`).join("");

    return execAsync(["bash", "-c", cmd]).catch((err) => {
        console.error(cmd, err);
        return "";
    });
}
