class Site < ApplicationRecord

  def self.all_sites_with_pos
    @sites = {}
    Site.all.each do |site|
      next if site.lat.blank? || site.lng.blank?
      @sites["#{site.lat}#{site.lng}"] = {
          lat: site.lat, 
          lng: site.lng,
          #infowindowcontent: ApplicationController.render('maps/_infowindow', locals: {:@site => site}, layout: false).gsub(/\n/,''),
          id: site.id,
          icon_url: site.icon_url.present? ? site.icon_url : 'house_question.png',
          first_name: site.first_name || '',
          last_name: site.last_name || '',
          address: site.address || '',
          email: site.email || '',
          phone: site.phone || '',
          notes: site.notes || '',
      }
    end
    @sites
  end
end
