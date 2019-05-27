class Shrink < ApplicationRecord

  def compress_and_check_url
    make_properurl # generate proper url
  	unless check_properurl.nil? # if proper url is already present
      false
    else # if proper url is not present then generate random url
      compress_url
      true
    end
  end

  def compress_url
  	url = ([*('a'..'z'), *('0'..'9')]).sample(7).join
    data = Shrink.where(shortname: url).last
    self.compress_url if data.present? # if random generated url is already presented in the table
    self.shortname = url
  end

  def check_properurl
    Shrink.find_by_proper_url(self.proper_url)
  end

  def make_properurl
    org_name = self.originalname.downcase.strip.gsub %r{(?<!:)/+(?=/)}, '' # removing all repeatitive forward slash such as www.////facebook.com//hi/s//234//
    org_name = org_name.gsub(/(https?:\/\/)|(www\.)/,"")      # removing  https:// or http:// from the url
    # removing slash in last position after com such as: www.google.com/ or google.com/
    org_name.slice!(-1) if org_name[-1] == "/"
    if org_name.include?(".com") # if url is google or www.google
      self.proper_url = "https://www." + org_name
    else
      self.proper_url = "https://www." + org_name + ".com" 
    end
  end


end
