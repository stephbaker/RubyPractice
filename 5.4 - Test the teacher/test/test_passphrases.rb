require 'minitest/autorun'
require 'passphrase_checker'

class TestPassPhrases < Minitest::Test

    def test_to_make_sure_letters_get_sorted_properly
        actual = PassphraseChecker.sorted_words("ksdf fdsa qwyr w r")
        assert_equal(["fdsa","ksdf", "qwyr", "r", "w"], actual)
    end

    def test_to_make_sure_valid_method_works
        assert(PassphraseChecker.valid?("ksdf fdsa qwyr w r"))
    end

    def test_to_make_sure_valid_method_with_2_same_words_is_invalid
       refute(PassphraseChecker.valid?("ksdf fdsa qwyr fdsa r"))
    end
    
    def est_to_make_sure_it_works_with_correct_user_inputs
        actual = PassphraseChecker.num_valid(["asdf fdsa qwyr w r", "asr rewe"])
        assert_equal("2", "#{actual}")
    end
    
    def test_to_make_sure_capitals_are_invalid_Passphrase
        actual = PassphraseChecker.num_valid(["Asdf fDsa qWyr w r"])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_one_word_is_invalid_Passphrase
        actual = PassphraseChecker.num_valid(["asdf"])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_doubles_are_invalid_Passphrase
        actual = PassphraseChecker.num_valid(["asdf fdsa qwyr w rre w"])
        assert_equal("0", "#{actual}")
    end
    
    def test_to_make_sure_that_same_letters_different_amount_are_valid_Passphrase
        actual = PassphraseChecker.num_valid(["aaa aa aaaaa aaaa", "asr asgd"])
        assert_equal("2", "#{actual}")
    end

    def test_to_make_sure_it_works_with_empty_array_Passphrase
        actual = PassphraseChecker.num_valid([])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_it_doesnt_works_with_empty_string_Passphrase
        actual = PassphraseChecker.num_valid([""])
        assert_equal("0", "#{actual}")
    end

end 

class TestAnagramPassPhrase

    def test_to_make_sure_it_works_with_correct_user_inputs
        actual = AnagramPassphraseChecker.num_valid(["asdf qwyr w r", "asr rewe"])
        assert_equal("2", "#{actual}")
    end

    def test_to_make_sure_letters_from_third_word_is_not_valid_anagram
        actual = AnagramPassphraseChecker.num_valid(["asdf qwyr fdsa r"])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_doubles_are_invalid_anagram
        actual = AnagramPassphraseChecker.num_valid(["asdf qwyr asdf r"])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_that_same_letters_different_amount_are_valid_anagram
        actual = AnagramPassphraseChecker.num_valid(["aaa aa a"])
        assert_equal("1", "#{actual}")
    end
    
    def test_to_make_sure_rearrangements_are_invalid_anagram
        actual = AnagramPassphraseChecker.num_valid(["aio iao aoi oai"])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_empty_strings_are_invalid_anagram
        actual = AnagramPassphraseChecker.num_valid([""])
        assert_equal("0", "#{actual}")
    end

    def test_to_make_sure_empty_arrays_output_correct_answer_anagram
        actual = AnagramPassphraseChecker.num_valid([])
        assert_equal("0", "#{actual}")
    end
    
end
