# Secret Messages

A program to encode strings of text to image files, or decode from the same image files

## Restrictions

The input text strings can almost every UTF-8 character, the main exception is "\" which is a special character in ruby, telling the code that the following character is special, and is therefore not interpreted as a character in the string.

The images need to be bmp files, since they don't have any compression and the pixel data is easily changeable, but the images will sometimes break depending on the type of bmp.
To prevent this, ms paint can be used to first convert the images to 16 color bitmap, and then 24 bit bitmap.
