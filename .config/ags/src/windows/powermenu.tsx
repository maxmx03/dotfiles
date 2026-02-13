import { windows_names } from "@/windows"
import { PowerMenuModule } from "@/modules/powermenu/powermenu"
import { Popup } from "@/widgets/popup"

export function PowerMenuWindow() {
  return (
    <Popup name={windows_names.powermenu}>
      <PowerMenuModule />
    </Popup>
  )
}
