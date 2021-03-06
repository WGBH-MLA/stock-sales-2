require 'nokogiri'

describe 'fm_to_csv.xsl' do
  # Not that the XSL is not executed on the server in production:
  # it is fetched by Filemaker and run there.
  
  it 'produces expected CSV' do
    xml = Nokogiri::XML(File.read(__dir__ + '/../fixtures/fm-export-results.xml'))
    xsl = Nokogiri::XSLT(File.read(__dir__ + '/../../public/fm_to_csv.xsl'))
    csv = xsl.apply_to(xml)
    puts '(Copy and paste this to update fixture:)'
    puts csv
    expect(csv).to eq(File.read(__dir__ + '/../fixtures/fm-export.csv'))
  end
end