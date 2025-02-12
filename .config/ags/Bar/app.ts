import { App } from "astal/gtk4";
import style from "./style.scss";
import Bar from "./widget/Bar";
import { apply_resolution_to_css } from "./globals";
import Corners from "./widget/components/Corners/Corners";
import { monitorFile } from "astal";

App.start({
  instanceName: "Bar",
  css: style,
  main() {
    Bar(0);
    App.get_monitors().map(Corners);
    apply_resolution_to_css();
  },
});
