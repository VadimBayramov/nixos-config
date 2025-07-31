{ config, pkgs, lib, inputs, ... }:

{
  # импорт основного модуля end-4-dots
  imports = [
    inputs.illogical-impulse.homeManagerModules.default
  ];

  # (опять же) в домашней конфигурации можно тоже задавать
  # дополнительные опции для illogical-impulse,
  # но в нашем случае всё включено через system-модуль.
}
