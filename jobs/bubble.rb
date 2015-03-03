

count = 1
SCHEDULER.every '20s', :first_in => '2s' do |job|
  puts "Sending BUBBLE"
  count += 1
  title = "a quite long title #{count}"
#  send_event('bubble', { title: title, text: "atextfadfsasdf asdf asdfasdf asdf asdf asdf asdf asdf asdf asdf asdfasdfasdfasd fasdfasdfasdfasd fasd fasd fes  adsfadsf asdf ajsdfoasdfbadsf90adsfb adsf 98asdfibaps dfya8sdf bvadsfub a9sd8f 90a8sdfy ab dsf asd89f7asdf basdf8asdf7-ad0s9fb asdf " })
    send_event('bubble', {
                 title: title,
                 text: "atextfadfsasdf asdf asdfasdf asdf asdf asdf asdf asdf asdf asdf asdfasdfasdfasd fasdfasdfasdfasd fasd fasd fes  adsfadsf asdf ajsdfoasdfbadsf90adsfb",
                 color: "blue"
               })
end
