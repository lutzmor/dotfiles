{
  enable = true;
  backend = "glx";
  fade = true;
  fadeDelta = 10;
  fadeSteps = [ "0.04" "0.04" ];
  inactiveDim = "0.0";
  shadow = false;
  shadowOffsets = [ (-60) (-60) ];
  shadowOpacity = "0.20";
  activeOpacity = "1.0";
  inactiveOpacity = "0.8";
  opacityRule = [
    "90:class_g = 'st' && focused"
    "60:class_g = 'st' && !focused"
  ];
}
