

class CLI
  def call
    Scraper.scrape_article_list
    puts 'Welcome to the Up-to-date Article List of How the US Governemnt is Working to Preserve Endangered Species'
    puts
    list_articles
# Runs scraper of initial site that returns list of articles (.scrape_article_list method). Assigned to .call method. First puts some text. Returns a list of articles with list_articles variable (see below).
    
   # puts 'Would You Like to Select an Aritcle Number for More Info? y/n'
# Asks for user input to choose an article    
     #input = gets.strip
     loop do
           puts 'Would You Like to Select an Aritcle Number for More Info? y/n'

       input = gets.strip
        if input == "n"
         puts "Have a great day!" 
         break
        elsif input == "y"
         puts "Select Article Number:"
         input2 = gets.strip
         article = Article.all[input2.to_i-1]
         puts show_details(article)
         sleep 5
        list_articles
                   puts 'Would You Like to Select an Aritcle Number for More Info? y/n'

       else 
        puts "Try again"
       until input == "y" || "n"
       end
     
    
  
   
# Assigns a particular article choice from Article.all array (input from user to choose index of selected article) and assigns to 'article' variable    
    article = Article.all[input2.to_i-1]
  end

# Scrapes url page of selected article and returns subtitle   
    Scraper.scrape_article(article)
end
end
    
    #puts show_details(article)

    
    
    
  
  def list_articles
# Returns entire list of articles, with an index, and puts the index (+1) and the article title (from title method in Article class)    
    Article.all.each_with_index do |art, i|
      puts "#{i + 1}. #{art.date}. #{art.title}"
    end
  end
# Working  
  def show_details(article)
   puts "Article Description:
   #{article.description}
   For Complete Article, visit: #{article.url}"
   
    
  end
end
