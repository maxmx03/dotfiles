import app from "ags/gtk4/app";
import style from "./style.scss";
import Bar from "@/widgets/Bar";
import Calendar from "@/widgets/Calendar";
import AppLauncher from "@/widgets/AppLauncher";
import QuickSettings from "@/widgets/QuickSettings";
import { PowerMenuWindow } from "@/windows/powermenu";

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar);
    app.get_monitors().map(Calendar);
    app.get_monitors().map(AppLauncher);
    app.get_monitors().map(AppLauncher);
    app.get_monitors().map(QuickSettings);
    PowerMenuWindow();
  },
});
