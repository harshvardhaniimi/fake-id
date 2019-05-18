# making a quote generator using quote of the day from Wikiquotes

library("rvest")

url = read_html("https://en.wikiquote.org/wiki/Wikiquote:Quote_of_the_Day")
dat = html_nodes(url, "dd")
quote1 = html_text(dat)
head(quote1)

dat2 = html_nodes(url, "li")
quote2 = html_text(dat2)

quote=rbind(quote1,quote2)

length(quote)

rand = ceiling(runif(1)*5880)
quote[rand]

phrase = "in"
quote[sample(grep(phrase,quote,ignore.case = T),1)]

#put this code to update Shiny app
#rsconnect::deployApp("D:/Competition and Work/Projects/Quotes_Generator")
