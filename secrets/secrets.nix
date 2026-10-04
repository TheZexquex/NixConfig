let
  homenix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKnUPf31V72xBN4Qv51t8UjXqWd3we7h7XybvFkVVw3";
  # host key of hetznix (/etc/ssh/ssh_host_ed25519_key.pub)
  hetznix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEHdGdG0rOvOSIotQfuZqC5rG4O1Ano3WPeRG3g1ic8+";
in {
  "calendar-email.age".publicKeys = [homenix];

  "hetznix-postgres.env.age".publicKeys = [homenix hetznix];
  "hetznix-authentik.env.age".publicKeys = [homenix hetznix];
  "hetznix-wakapi.env.age".publicKeys = [homenix hetznix];
  "hetznix-crowdsec.env.age".publicKeys = [homenix hetznix];
  "hetznix-restic-repository.age".publicKeys = [homenix hetznix];
  "hetznix-restic-password.age".publicKeys = [homenix hetznix];
}
