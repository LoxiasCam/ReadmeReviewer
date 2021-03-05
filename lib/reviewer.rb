require 'rainbow'
class Reviewer
  def self.project_name?(file_data)
    if file_data.match(/# /)
      Rainbow("\n\nGood job! You have a nice header with your project name.").green
    else
      Rainbow("\n\nOops! I couldn't find a header with your project name."\
      "\nConsider adding a header with your project's name within the first three lines of your readme."\
      "\nUsing Markdown, you can achieve this using # followed by your project's name"\
      "\nFor example: # Project Name").yellow
    end
  end

  def self.screenshot?(file_data)
    if file_data.match(/!\[.+\]\(.+\)/)
      Rainbow("\n\nGood job! It looks like your Readme has at least one image!").green
    else
      Rainbow("\n\nOops! I couldn't find any images in your Readme."\
        "\nConsider adding at least one image showcasing your project for better clarity!"\
        "\nUsing Markdown, you can achieve this using ! followed by optional text in [] followed by the link in ()"\
        "\nFor example: ![example_picture](./lib/example.jpg)").yellow
    end
  end

  def self.built_with?(file_data)
    if file_data.match(/#* ?Built With/i)
      Rainbow("\n\nGood job! It looks like your Readme has a 'Built With' section!").green
    else
      Rainbow("\n\nOops! I couldn't find any 'Built With' section in your Readme."\
        "\nConsider adding this section to your project for better clarity!"\
        "\nMake sure to include all the technologies and/or languages that you used in your project."\
        "\nFor example: The ReadmeReviewer was built using Ruby!").yellow
    end
  end

  def self.live_demo?(file_data)
    if file_data.match(/\[.+\]\(.+\)/) and file_data.match(/#* ?Live Demo/i)
      Rainbow("\n\nGood job! It looks like your Readme has a 'Live Demo' link!").green
    else
      Rainbow("\n\nOops! I couldn't find any links to a 'Live Demo' in your Readme."\
        "\nConsider adding a link to the Live Demo of your project!"\
        "\nIf you have a link, this test could have also failed if the reviewer didn't find a header for your Live Demo section."\
        "\nUsing Markdown, you can add a link by typing your text in [] followed by the link in ()"\
        "\nFor example: [example_text](www.livedemo-link.com)").yellow
    end
  end

  def self.getting_started?(file_data)
    if file_data.match(/#* ?Getting Started/i)
      Rainbow("\n\nGood job! It looks like your Readme has a 'Getting Started' section!").green
    else
      Rainbow("\n\nOops! I couldn't find a 'Getting Started' section in your Readme."\
        "\nConsider adding this section to your project."\
        "\nThis can help you give instructions on setting up your project locally."\
        "\nKeep in mind prerequisites or usage steps that other people may need!"\
        "\nFor example: Before using ReadmeReviewer, run bundle install from your console to install the gems required.").yellow
    end
  end

  def self.authors?(file_data)
    if file_data.match(/#* ?Author/i)
      Rainbow("\n\nGood job! It looks like your Readme has an 'Author(s)' section!").green
    else
      Rainbow("\n\nOops! I couldn't find any 'Author(s)' in your Readme."\
        "\nConsider adding this section to your project"\
        "\nEspecially important if you worked with a partner. This ensures both of you get the credit you deserve!"\
        "\nFeel free to add whatever social media you're comfortable with."\
        "\nIf possible, try adding at least your GitHub, LinkedIn and Twitter.").yellow
    end
  end

  def self.contributing?(file_data)
    if file_data.match(/#* ?Contributing/i)
      Rainbow("\n\nGood job! It looks like your Readme has an 'Contributing' section!").green
    else
      Rainbow("\n\nOops! I couldn't find any 'Contributing' section in your Readme."\
        "\nConsider adding this section to your project."\
        "\nIf your projects catches someone else's attention, they can take a look here to see how or if they can help."\
        "\nIt's also a good idea to include a link to the issues page of your project so someone can work on them."\
        "\nAt the very least, a friendly invitation can help give someone that push to contribute to your project!").yellow
    end
  end

  def self.support?(file_data)
    if file_data.match(/#* ?Support/i)
      Rainbow("\n\nGood job! It looks like your Readme has a 'Support' section!").green
    else
      Rainbow("\n\nOops! I couldn't find a 'Support' section in your Readme."\
        "\nConsider adding this section to your project."\
        "\nIf someone likes your project, a friendly reminder to give you a star doesn't hurt!"\
        "\nIt also helps tie up your Readme file neatly, and shows that you're proud of your work.").yellow
    end
  end

  def self.acknowledgments?(file_data)
    if file_data.match(/#* ?Acknowledgments/i)
      Rainbow("\n\nGood job! It looks like your Readme has an 'Acknowledgments' section!").green
    else
      Rainbow("\n\nOops! I couldn't find an 'Acknowledgments' section in your Readme."\
        "\nConsider adding this section to your project."\
        "\nThis is especially important if you're using a snippet of someone else's code, or a third party plugin!"\
        "\nAt the very least, a friendly shoutout to your Standup Team is always appreciated :D").yellow
    end
  end

  def self.license?(file_data)
    if file_data.match(/#* ?License/i)
      Rainbow("\n\nGood job! It looks like your Readme has a license!").green
    else
      Rainbow("\n\nOops! I couldn't find a license in your Readme."\
        "\nConsider adding a license to your project, along with a link to the license you're using."\
        "\nThis way you can communicate clearly who, how and in what way people can use your project."\
        "\nOne of the most common licenses used is an MIT License.").yellow
    end
  end
end
