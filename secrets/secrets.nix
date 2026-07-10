let
  homenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3";
in {
  "calendar-email.age".publicKeys = [homenix];
}
