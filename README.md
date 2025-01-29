# Secret Messages

A program to encode strings of text to image files, or decode from the same image files

## How to use

All the important code is in the lib folder. To encode text into an image, place an image in the lib folder, and change the input string or file to your input text in variables.rb. Also make sure the image search path is accurate in variables.rb, and then run encode.rb, and a file named "output.bmp" should appear (will overwrite other output.bmp in the same search path).

To decode the string from an image with encoding, make sure the input settings are the same as for the encoding (aggression, start position and breakline) and run decode.rb, which will create / overwrite output.txt with the string that was encoded.

## Restrictions

The code currently supports roughly 100.000 characters for a 500x500 image on aggression 1, and is multiplied by the aggression. If too much input text is supplied, the code will raise an exception instead of breaking the image.

The input text strings can almost every UTF-8 character, the main exception is "\" which is a special character in ruby, telling the code that the following character is special, and is therefore not interpreted as a character in the string.

The images need to be bmp files, since they don't have any compression and the pixel data is easily changeable, but the images will sometimes break depending on the type of bmp.
To prevent this, ms paint can be used to first convert the images to 16 color bitmap, and then 24 bit bitmap.