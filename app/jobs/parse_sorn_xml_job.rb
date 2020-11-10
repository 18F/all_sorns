class ParseSornXmlJob < ApplicationJob
  queue_as :default

  def perform(sorn_id)
    sleep 1

    sorn = Sorn.find(sorn_id)
    sorn.get_action_type
    puts sorn.xml_url
    sorn.get_xml if sorn.xml_url
    sorn.parse_xml if sorn.xml
    puts "Updated #{sorn.id}"
  end
end
