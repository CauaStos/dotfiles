import { App } from "astal/gtk3";
import style from "./widgets/base.scss";
import Base from "./widgets/Base";

App.start({
  icons: "~/.config/ags/icons",
  css: style,
  main() {
    Base(0);
  },
});
