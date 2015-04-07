class Series < ActiveRecord::Base
  has_many :episodes, dependent: :destroy
  accepts_nested_attributes_for :episodes, allow_destroy: true,  reject_if: lambda { |a| a.blank? }

  def description
    'This romantic comedy revolves around an antisocial high school student named Hikigaya Hachiman with a distorted view on life and no friends or girlfriend. When he sees his classmates talking excitedly about living their adolescent lives, he mutters: "They\'re a bunch of liars." When he is asked about his future dreams, he responds, "Not working." A teacher gets Hachiman to join the "Volunteer Service" club, which happens to have the school\'s prettiest girl, Yukinoshita Yukino.'
  end

  def cover
    'http://media.senscritique.com/media/000006545005/source_big/Yahari_Ore_no_Seishun_Love_Come_wa_Machigatteiru.jpg'
  end

  def views
    1750
  end

  def downloads
    547
  end

  def episodes_count
    42
  end

  def author_name
    'Mr.Deity'
  end

  def original_name
    'Yahari Ore no Seishun Lovecome wa Machigatte Iru'
  end

  def edited_date
    '23 Apr, 2015, 15:00'
  end

end
