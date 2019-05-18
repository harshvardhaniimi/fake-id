## libraries
library("rvest")

## getting email id

url = read_html('http://www.yopmail.com/en/email-generator.php')
email = html_node(url,"#login")
email = xml_attr(email,"value")


## getting first name

url = read_html("http://www.first-names-meanings.com/country-indian-names.html")
fname = html_nodes(url,"#intro2 a")
rand = sample(1:length(fname),1)
fname = xml_attr(fname[rand],"title")
rm(rand)


## getting last name

url = read_html("http://indiannamesandsurnameslist.blogspot.com/")
lname = html_nodes(url,"#post-body-5763410367061847279 span")
x = html_text(lname)[-1]
lname = sample(c(x[-1]),1)
rm(x)

## Birthday
bday = sample(seq(as.Date('1980/01/01'), as.Date('2001/01/01'), by="day"),1)

## University
url = read_html("https://www.4icu.org/in/indian-universities.htm")
uni = html_nodes(url,"td")
uni = matrix(html_text(uni),ncol = 3,byrow=T)
uni = uni[1:(nrow(uni)-1),2:3]
rand = sample(1:nrow(uni),1)
uni_name = uni[rand,1]
uni_city = uni[rand,2]
rm(uni)

## password
password = stringi::stri_rand_strings(n=1, length=10, pattern="[A-Za-z0-9]")


## wallpaper for your desktop
wallpaper = "https://source.unsplash.com/random"

## religion and politics
religion = c("Hindu", "Muslim", "Christian", "Buddhist", "Jain", "Atheist", "Mandir Group")
religion = sample(religion,1)
politics = c("Bharatiya Janata Party", "Indian National Congress", "Bahujan Samaj Party", "Independent", "Anarchist")
politics = sample(politics,1)

## favourites
fav_colour = sample(grDevices::colors(),1)
pet = sample(c("cat","Dog","Snake","Tiger Cub","Chicken","Parrot"),1)

## Official
pan = paste(stringi::stri_rand_strings(n=1, length=3, pattern="[A-Z]"),
          "P", substr(lname,1,1),
          stringi::stri_rand_strings(n=1, length=4, pattern="[0-9]"),
          stringi::stri_rand_strings(n=1, length=1, pattern="[A-Z]"),sep = "")

# aadhaar with Verhoff check
aadhaar = unname(CheckDigit::AppendCheckDigit(stringi::stri_rand_strings(n=1, length=11, pattern="[0-9]"),
            'Verhoeff'))

rm(url)
