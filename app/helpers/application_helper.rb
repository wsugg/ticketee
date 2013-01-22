module ApplicationHelper
  def title(*parts) #<co id="ch03_790_1"/>
    unless parts.empty?
     content_for :title do
      (parts << "Ticketee").join(" - ")
     end
    end
  end
end
