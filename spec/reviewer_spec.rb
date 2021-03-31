require 'io/console'
require 'rspec'
require 'tempfile'

require_relative '../lib/reviewer'

describe Reviewer do
  let(:readme) { Tempfile.new('document') }

  describe '.project_name?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.project_name? }.to raise_error ArgumentError
    end

    it 'returns a good message when readme has a project name' do
      readme.write '# Project Name'
      readme.rewind
      expect(Reviewer.project_name?(readme.read)).to include('Good job!')
    end

    it 'returns a bad message when readme has no project name' do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.project_name?(readme.read)).to include('Oops!')
    end
  end

  describe '.screenshot?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.screenshot? }.to raise_error ArgumentError
    end

    it 'returns a good message when readme has a screenshot' do
      readme.write('![example_picture](./lib/example.jpg)', mode: 'w')
      readme.rewind
      expect(Reviewer.screenshot?(readme.read)).to include('Good job!')
    end

    it 'returns a bad message when readme has no screenshot' do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.screenshot?(readme.read)).to include('Oops!')
    end
  end

  describe '.built_with?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.built_with? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has a 'Built With' section" do
      readme.write('## Built With', mode: 'w')
      readme.rewind
      expect(Reviewer.built_with?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Built With' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.built_with?(readme.read)).to include('Oops!')
    end
  end

  describe '.live_demo?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.live_demo? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has a 'Live Demo' section" do
      readme.write("## Live Demo \n [example_text](www.livedemo-link.com)", mode: 'w')
      readme.rewind
      expect(Reviewer.live_demo?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Live Demo' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.live_demo?(readme.read)).to include('Oops!')
    end
  end

  describe '.getting_started?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.getting_started? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has a 'Getting Started' section" do
      readme.write('## Getting Started', mode: 'w')
      readme.rewind
      expect(Reviewer.getting_started?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Getting Started' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.getting_started?(readme.read)).to include('Oops!')
    end
  end

  describe '.authors?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.authors? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has an 'Authors' section" do
      readme.write('## Author', mode: 'w')
      readme.rewind
      expect(Reviewer.authors?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Authors' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.authors?(readme.read)).to include('Oops!')
    end
  end

  describe '.contributing?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.contributing? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has a 'Contributing' section" do
      readme.write('## Contributing', mode: 'w')
      readme.rewind
      expect(Reviewer.contributing?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Contributing' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.contributing?(readme.read)).to include('Oops!')
    end
  end

  describe '.support?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.support? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has a 'Support' section" do
      readme.write('## Support', mode: 'w')
      readme.rewind
      expect(Reviewer.support?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Support' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.support?(readme.read)).to include('Oops!')
    end
  end

  describe '.acknowledgments?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.acknowledgments? }.to raise_error ArgumentError
    end

    it "returns a good message when readme has an 'Acknowledgments' section" do
      readme.write('## Acknowledgments', mode: 'w')
      readme.rewind
      expect(Reviewer.acknowledgments?(readme.read)).to include('Good job!')
    end

    it "returns a bad message when readme has no 'Acknowledgments' section" do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.acknowledgments?(readme.read)).to include('Oops!')
    end
  end

  describe '.license?' do
    it 'raises error when no file data is specified' do
      expect { Reviewer.license? }.to raise_error ArgumentError
    end

    it 'returns a good message when readme has a License' do
      readme.write('## license', mode: 'w')
      readme.rewind
      expect(Reviewer.license?(readme.read)).to include('Good job!')
    end

    it 'returns a bad message when readme has no License' do
      readme.write('badname', mode: 'w')
      readme.rewind
      expect(Reviewer.license?(readme.read)).to include('Oops!')
    end
  end

  after do
    readme.close
    readme.unlink
  end
end
