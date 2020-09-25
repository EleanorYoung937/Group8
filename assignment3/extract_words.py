import io
import re
from collections import defaultdict
from collections import OrderedDict
def main():
	#	import and read txt file
	#	saving grace reference: https://stackoverflow.com/questions/17912307/u-ufeff-in-python-string
	f = io.open("fairytales.txt", mode="r", encoding="utf-8-sig")
	txt = f.read()
	f.close()

	#	format text and make into a list
	#	change to lowecase
	txt = txt.lower()
	#	remove 'apostraphe s' at the end of words so they are counted with the nonplural version of that word
	txt = txt.replace("'s", "")
	#	find beginning of text so that information and table of contents is not included in wordcount
	temp = txt.split("\n\n\n\n")
	#for i in temp:
	#	print(len(i))
	idx = len(temp[3]) + len(temp[2]) + len(temp[1]) + len(temp[0]) + 4 * len("\n\n\n\n") - 1
	#	turn into a list of strings with only alphabetical characters
	txt = re.findall("[a-z]+", txt[idx:])

	#	make alltext.txt
	g = open("alltext.txt", "w")
	g.write("\n".join(txt))
	g.close()


	#	make uniquewords.text using a dictionary and join
	wordCount = defaultdict(int)
	for i in txt:
		wordCount[i] += 1
	h = open("uniquewords.txt", "w")
	h.write("\n".join(wordCount.keys()))
	h.close()

	#	make occuranceCount.txt using another dictionary and a list
	occuranceCount = defaultdict(int)
	for i in wordCount.values():
		occuranceCount[i] += 1
	occuranceString = []
	occuranceCount = {k: v for k, v in sorted(occuranceCount.items(), key=lambda item: item[1])}
	for i,j in sorted(occuranceCount.items()):
		occuranceString.append((str(i) + " : " + str(j)))
	k = open("wordfrequency.txt", "w")
	k.write("\n".join(occuranceString))
	k.close()

main()