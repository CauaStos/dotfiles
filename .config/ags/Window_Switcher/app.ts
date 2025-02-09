import { App, Gdk, Gtk } from "astal/gtk4";
import style from "./widget/switcher.scss";
import Switcher from "./widget/Switcher";
import {
  request_cycle_next,
  request_switch_window,
} from "./widget/switcher_daemon";

App.start({
  instanceName: "WindowSwitcher",
  requestHandler(request: string, res: (Response: any) => void) {
    let result_message: string;
    switch (request) {
      case "cycle_next":
        result_message = request_cycle_next();
        return res(result_message);
      case "switch_window":
        result_message = request_switch_window();
        return res(result_message);
    }
    res("Unknown");
  },
  css: style,
  main() {
    Switcher();
  },
});
