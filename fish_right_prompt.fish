function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _git_logplus
	echo (command git log --numstat --pretty="%H" | awk 'NF==3 {plus+=$1} END {printf("+%d\n", plus)}' 2> /dev/null)
end

function _git_logminus
	echo (command git log --numstat --pretty="%H" | awk 'NF==3 {minus+=$2} END {printf("-%d\n", minus)}' 2> /dev/null)
end

function fish_right_prompt

	set -l normal (set_color normal)
	set -l yellow (set_color -d bryellow)
	set -l blue (set_color -d brblue)
	set -l green (set_color -d brgreen)
	set -l red (set_color -d red)


	if [ (_git_branch_name) ]
		set -l git_branch (_git_branch_name) 

		if [ (_git_dirty) ]

			set git_info $yellow $git_branch

		else

			set git_info $blue $git_branch # ' ' $green (_git_logplus) ' ' $red (_git_logminus)
		
		end

		echo -n -s ' ' $git_info $normal
	
	end
end