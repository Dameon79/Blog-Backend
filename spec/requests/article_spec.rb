require 'rails_helper'

RSpec.describe DSBlogSchema do
  describe "shows the article data" do
    context "when there's an article" do
      let(:result) {
        res = DSBlogSchema.execute(
          query_string
        )
        # Print any errors
        pp res if res["errors"]
        res
      }

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
    context "returns all articles on a page" do
      let(:result) {
        res = DSBlogSchema.execute(
          query_string
        )
        # Print any errors
        pp res if res["errors"]
        res
      }

      let!(:articles) { create_list(:article, 60) }

      let(:query_string) {
        %|
          { 
            articles {
              edges {
                node {
                  title
                }
              }
            }
          }
        |
      }
      it "returns the article array" do
        articles_data = result["data"]["articles"]["edges"]
        expect(articles_data.count).to eq 60
        expect(articles_data.map { |a| a["node"]["title"] }).to match Article.most_recent.pluck(:title)
      end
    end
  end

  describe "returns paginated articles" do
    context "returns the selected number of articles" do
      let(:result) {
        res = DSBlogSchema.execute(
          query_string
        )
        # Print any errors
        pp res if res["errors"]
        res
      }

      let!(:articles) { create_list(:article, 10) }
      let!(:page) { 2 }

      let(:query_string) {
        %|
          {
            articles(page: #{page}) {
              edges {
                node {
                  title
                }
              }
            }
          }
        |
      }
      it "returns the selected number of articles" do
        articles_data = result["data"]["articles"]['edges']
        expect(articles_data.map { |a| a["node"]["title"] }).to match Article.most_recent[(page * Pagy::VARS[:items]) - Pagy::VARS[:items], Pagy::VARS[:items]].pluck(:title)
      end
    end
  end
end