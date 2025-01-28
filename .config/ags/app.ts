import { App } from "astal/gtk3";
import style from "./style.scss";
import Base from "./widget/Base";

App.start({
  css: style,
  main() {
    Base(1);
  },
});
