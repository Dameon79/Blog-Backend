require 'rails_helper'

RSpec.describe DSBlogSchema do
  describe "Adding Comments" do
    context "Adds a comment to an article" do
      let(:result) {
        res = DSBlogSchema.execute(
          query_string
        )
        # Print any errors
        pp res if res["errors"] 
        res
      }

      let!(:article) { create(:article) }
   
      let(:query_string) { 
        %|
        mutation addComment {
          addComment(slug: "#{article.slug}", name: "bob", body: "Testing Comment", avatar: "http:localhost:3000") {
            article {
              id
              title
              text
              comments {
                name
                body
                avatar
              }
            }
          }
        }
      | 
    }

      
      it "returns the article data" do
        article_data = result["data"]["addComment"]["article"]
        comment = result["data"]["addComment"]["article"]["comments"]
        
        expect(article_data["title"]).to eq(article.title)
        expect(article_data["text"]).to eq(article.text)
        expect(comment[0]["body"]).to match("Testing Comment")
        
      end
    end
  end
end
 