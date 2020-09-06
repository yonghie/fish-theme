function fish_prompt
  set -l cwd (basename (prompt_pwd))

  set -l normal (set_color -d normal)
  set -l white (set_color -d white)
  set -l black (set_color -o black)

  set -l yellow (set_color -o yellow)
  set -l blue (set_color -d brblue)

  set -l time (timedatectl | grep 'Local time' | cut -c 43-47)



  echo -n -s $yellow (hostname) $black '@' $white $cwd $normal

  echo -n -s ' :: ' $normal

end
