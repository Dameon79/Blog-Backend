require 'rails_helper'

RSpec.describe DSBlogSchema do
  # Call `result` to execute the query
  let(:result) {
    res = DSBlogSchema.execute(
      query_string
    )
    # Print any errors
    pp res if res["errors"]
    res
  }

  describe "shows the article data" do
    context "when there's an article" do
      let!(:article) { create(:article, :with_comments) }
   
      let(:query_string) { 
        %|
          { 
            article(id: #{article.id}) { 
              title 
              text
              comments {
                body 
              }
            } 
          }
        | 
      }
      it "returns the article data" do
        article_data = result["data"]["article"]
        comment = result["data"]["article"]["comments"]

        expect(article_data["title"]).to eq(article.title)
        expect(article_data["text"]).to eq(article.text)
        expect(comment.first["body"]).to eq(article.comments.first.body)
      end
    end
  end

  describe "all articles" do
    context "returns all articles" do
      let!(:articles) { create_list(:article, 5) }

      let(:query_string) {
        %|
          { 
            articles {
              id
              title
            }
          }
        |
      }
      it "returns the article array" do
        articles_data = result["data"]["articles"]
       
        expect(articles_data.count).to eq 5
        expect(articles_data.map { |a| a["title"] }).to match articles.pluck(:title)
      end
    end
  end
end