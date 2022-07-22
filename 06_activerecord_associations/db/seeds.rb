dogs_attributes = [
  {
    name: "Olivia",	
    birthdate: "2018-08-31",
    breed:	"Terrier",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229064/zx6CPsp_d_utkmww.webp"
  },
  {
    name: "Molly",	
    birthdate: "2019-06-21",
    breed:	"Terrier / Chihuahua",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229038/EEE90-E50-25-F0-4-DF0-98-B2-0-E0-B6-F9-BAA89_menwgg.jpg"  
  },
  {
    name: "Kaya",	
    birthdate: "2017-09-27",
    breed:	"Blueheeler",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229011/8136c615d670e214f80de4e7fcdf8607--cattle-dogs-mans_vgyqqa.jpg"
  },
  {
    name: "Chop",	
    birthdate: "2020-07-31",
    breed:	"German Shorthaired Pointer",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822267/cdbd77592e3ef91e8cc1cf67d936f94f_fkozjt.jpg"
  },
  {
    name: "Baron",	
    birthdate: "2012-12-23",
    breed:	"GSD/English Lab mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629567379/baron_x0s6ai.jpg"
  },
  {
    name: "Lennon Snow",
    birthdate: "2021-06-18",
    breed: "Pomeranian",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1627585625/lennon-with-tennis-ball_slg2zn.jpg"
  },
  {
    name: "Ash",
    birthdate: "2020-05-18",
    breed: "Husky",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229192/photo-1568572933382-74d440642117_p6mrgm.jpg"
  },
  {
    name: "DJ", 
    birthdate: "2020-05-18",
    breed: "Dachsund Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822169/365758759_qyupo8.jpg"
  },
  {
    name: "Winter",
    birthdate: "2013-05-18",
    breed: "Husky Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822144/561229495_lldnll.jpg"
  },
  {
    name: "CeCe",
    birthdate: "2019-05-18",
    breed: "Lab mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821709/ee7eee7ee62c9c2b053e65dc9c9e1a55_iwjweh.jpg"
  },
  {
    name: "Kane",
    birthdate: "2021-05-23",
    breed: "Terrier Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821681/2_lu9ccw.jpg"
  },
  {
    name: "Nutmeg",
    birthdate: "2022-02-27",
    breed: "Lab Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822016/Nutmegupdate97_kyqlqo.jpg"
  },
  {
    name: "Sadie",
    birthdate: "2021-09-18",
    breed: "Lab/Terrier Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822095/55860f51e40159e2c34766352b214c36_g3plyx.jpg"
  },
  {
    name: "Sal",
    birthdate: "2020-05-11",
    breed: "Lab Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822067/83c97c9fe7d2d82ce90c1d8ca9fde44c_zckdjy.jpg"
  },
  {
    name: "Sinton",
    birthdate: "2020-04-27",
    breed: "Terrier Mix",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821474/4_bbgw1p.jpg"
  },
  {
    name: "Cupcake",
    birthdate: "2022-03-13",
    breed: "???",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229142/it-s-national-dog-day-dogs-41538267-400-400_fvq8wk.jpg"
  },
  {
    name: "Luci",
    birthdate: "2020-05-09",
    breed: "Samoyed",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822371/f6p9jE2_acndnl.jpg"
  },
  {
    name: "Simon",
    birthdate: "2015-08-23",
    breed: "Shiba Inu",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822438/B3-FAF888-5656-4746-BE22-597185404078_bpbvvs.jpg"
  },
  {
    name: "Snoopy",
    birthdate: "1990-01-01",
    breed: "Snooop",
    image_url: "https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822337/sn-color_qesmhx.jpg"
  }
]

dogs_attributes.each do |attributes|
  Dog.create(attributes)
end

puts "#{Dog.count} dogs created"