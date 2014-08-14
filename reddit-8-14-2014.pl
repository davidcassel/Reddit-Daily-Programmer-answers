#!usr/bin/perl

# From http://www.reddit.com/r/dailyprogrammer/comments/2dgd5v/8132014_challenge_175_intermediate_largest_word/
#
# Given a string of words and a string of letters. Find the largest
# string(s) that are in the 1st string of words that can be formed from
# the letters in the 2nd string.
#
#    Letters can be only used once. So if the string has "a b c" then
#    words like "aaa" and "bbb" do not work because there is only 1 "a"
#    or "b" to be used. If you have tie for the longest strings then
#    output all the possible strings. If you find no words at all then
#    output "No Words Found"

print "Give me a string of words    \n";
chomp($string_of_words = <STDIN>);

print "Now give me a string of letters    \n";
chomp($string_of_letters = <STDIN>);

$letters_in_words  = length($string_of_words);
$original_string_of_letters = $string_of_letters;

for ($x = 0; $x < $letters_in_words; $x++ ){
    $letter_to_check = substr($string_of_words, $x, 1);
    if ( index($string_of_letters, $letter_to_check) == -1 ) {
        $new_string = '';
        $string_of_letters = $original_string_of_letters;
    } else {

        $string_of_letters =~ s/$letter_to_check//;
        $new_string = $new_string . $letter_to_check;

        if ( length($new_string) == length($longest_string) ) {
        push(@other_solutions,$new_string);
        }

        if (length($new_string) > length($longest_string)) {
           $longest_string = $new_string;
           @other_solutions=();
        };
    }
}

if ( length($longest_string) < 1) { print "No Words Found" }
else {
    print "The longest string is: $longest_string \n";
    if (@other_solutions) {
        print "Other possible solutions are @other_solutions ";
    }
}

