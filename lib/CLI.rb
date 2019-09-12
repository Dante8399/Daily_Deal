class CLI
  def call
    Scraper.scrape_article_list
    puts 'welcome, here is a list'
    puts
    list_articles
    
    puts 'choose one please:'
    input = gets.strip
    
    
    article = Article.all[input.to_i-1]
    
    Scraper.scrape_article(article)
    
    show_details(article)
    
    
    
  end
  
  def list_articles
    Article.all.each_with_index do |art, i|
      puts "#{i + 1}. #{art.title}"
    end
  end
  
  def show_details(article)
    puts   
  end
end