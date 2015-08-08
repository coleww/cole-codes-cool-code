puts `middleman build`
`cp -r build/* ../colewillsea.com/blog`
Dir.chdir("../colewillsea.com") do
  `git add -A`
  `git commit -m 'deploy blog #{Time.now}'`
  `divshot push`
  if !ARGV[0].nil?
    `divshot promote development production`
  end
end

