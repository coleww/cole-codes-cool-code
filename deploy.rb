puts `middleman build`
`cp -r build/* ../colewillsea.com/blog`
Dir.chdir("../colewillsea.com") do
  `git add -A`
  `git commit -m 'deploy blog #{Time.now}'`
  `divshot push`
end

