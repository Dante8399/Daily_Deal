

class CLI
  def call
    Scraper.scrape_article_list
    sleep 3
    list_articles
              # Runs scraper of initial site that returns list of articles (.scrape_article_list method). Assigned to .call method.  Returns a list of articles with list_articles variable (see below).
    
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
           sleep 15
    list_articles
           
        else 
          puts "Try again"
        until input == "y" || "n"
       end
          # Assigns a particular article choice from Article.all array (input from user to choose index of selected article) and assigns to 'article' variable    
    article = Article.all[input2.to_i-1]
  end
    
 end
end
    
    

    
    
    
  
  def list_articles
# Returns entire list of articles, with an index, and puts the index (+1) and the article title (from title method in Article class)    
    Article.all.each_with_index do |art, i|
      puts "#{i + 1}. #{art.date}. #{art.title}
      
      "
    end
  end
 
  def show_details(article)
  Scraper.scrape_article(article)
   puts "Article Description:
  
   #{article.news_sub_title}
   
   
   For the Complete Article, visit: #{article.url}"
   
    
  end
end
