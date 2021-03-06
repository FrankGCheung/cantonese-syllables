require "cantonese/syllables/scraper"

describe Cantonese::Syllables::Scraper do
  let (:'scraper') { Cantonese::Syllables::Scraper }
  context "#list" do
    it "should return syllable list" do
      list = scraper.list
      expect(list).to be_a(Array)
      expect(list).to be_include(text: "啊", url: "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=-&final=aa")
      expect(list).to be_include(text: "哼", url: "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=h&final=ng")
    end
  end

  context "#syllable" do
    it "should return syllable details" do
      syllable = scraper.syllable("http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=-&final=aa")
      expect(syllable).to be_a(Array)
      expect(syllable).to be_include(syllable: "aa4", characters: ["啊"])

      syllable = scraper.syllable("http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=gw&final=ai")
      expect(syllable).to be_a(Array)
      expect(syllable).to be_include(syllable: "gwai1", characters: %w{傀 刲 圭 媯 廆 歸 洼 溈 珪 瑰 皈 硅 茥 藈 邽 閨 騩 鮭 龜})
    end
  end

  context "#word" do
    it "should return sounds of a word" do
      sounds = scraper.word("不")
      expect(sounds).to be_a(Array)
      expect(sounds).to be_include("bat1")
      expect(sounds).to be_include("fau2")

      sounds = scraper.word("誠")
      expect(sounds).to be_a(Array)
      expect(sounds).to eq(["sing4"])
    end
  end
end