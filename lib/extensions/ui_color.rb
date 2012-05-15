class UIColor
  # reference: http://color.rubyforge.org/
  def self.from_html(html_colour)
    html_colour = html_colour.gsub(%r{[#;]}, '')
    case html_colour.size 
    when 3
      colours = html_colour.scan(%r{[0-9A-Fa-f]}).map { |el| (el * 2).to_i(16) }
    when 6
      colours = html_colour.scan(%r<[0-9A-Fa-f]{2}>).map { |el| el.to_i(16) }
    else
      raise ArgumentError
    end

    UIColor.colorWithRed(colours[0]/255.0, green: colours[1]/255.0, blue: colours[2]/255.0, alpha: 1)
  end
end