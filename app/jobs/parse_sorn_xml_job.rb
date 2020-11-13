class ParseSornXmlJob < ApplicationJob
  queue_as :default

  def perform(sorn_id)
    sorn = Sorn.find(sorn_id)
    puts sorn.xml_url
    sorn.get_xml
    sorn.parse_xml
    sorn.update_mentioned_sorns
    puts "Updated #{sorn.id}"
  end
end
