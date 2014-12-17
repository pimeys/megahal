class MegaHAL
  # This takes an array of capitalised (normalised) words, and returns an array
  # of keywords (which simply remove banned words, and switch some words with
  # their antonyms). This exists purely to emulate the original MegaHAL. It
  # would be better if keywords were learned by observing question-answer pairs.
  def self.extract(words)
    return GREETING if words.nil?
    words
      .map do |word|
        if word =~ /^[0-9]/
          nil
        elsif BANNED.include?(word)
          nil
        elsif SWAP.key?(word)
           SWAP[word]
        else
          word
        end
      end
      .compact
      .uniq
  end

  GREETING = ["G'DAY", "GREETINGS", "HELLO", "HULLO", "HI", "HOWDY", "WELCOME"]

  ANTONYMS = [
    ["DISLIKE", "LIKE"],
    ["HATE", "LOVE"],
    ["I", "YOU"],
    ["I'D", "YOU'D"],
    ["I'LL", "YOU'LL"],
    ["I'M", "YOU'RE"],
    ["I'VE", "YOU'VE"],
    ["LIKE", "DISLIKE"],
    ["LOVE", "HATE"],
    ["ME", "YOU"],
    ["MINE", "YOURS"],
    ["MY", "YOUR"],
    ["MYSELF", "YOURSELF"],
    ["NO", "YES"],
    ["WHY", "BECAUSE"],
    ["YES", "NO"],
    ["YOU", "I"],
    ["YOU", "ME"],
    ["YOU'D", "I'D"],
    ["YOU'LL", "I'LL"],
    ["YOU'RE", "I'M"],
    ["YOU'VE", "I'VE"],
    ["YOUR", "MY"],
    ["YOURS", "MINE"],
    ["YOURSELF", "MYSELF"],
    ["HOLMES", "WATSON"],
    ["FRIEND", "ENEMY"],
    ["ALIVE", "DEAD"],
    ["QUESTION", "ANSWER"],
    ["BLACK", "WHITE"],
    ["COLD", "HOT"],
    ["HAPPY", "SAD"],
    ["FALSE", "TRUE"],
    ["HEAVEN", "HELL"],
    ["GOD", "DEVIL"],
    ["NOISY", "QUIET"],
    ["WAR", "PEACE"],
    ["SORRY", "APOLOGY"]
  ]
  SWAP = Hash[ANTONYMS + ANTONYMS.map(&:reverse)]

  AUXILIARY = <<-EOS.each_line.to_a.map(&:strip)
    DISLIKE
    HE
    HER
    HERS
    HIM
    HIS
    I
    I'D
    I'LL
    I'M
    I'VE
    LIKE
    ME
    MINE
    MY
    MYSELF
    ONE
    SHE
    THREE
    TWO
    YOU
    YOU'D
    YOU'LL
    YOU'RE
    YOU'VE
    YOUR
    YOURS
    YOURSELF
  EOS

  BANNED = <<-EOS.each_line.to_a.map(&:strip)
    A
    ABILITY
    ABLE
    ABOUT
    ABSOLUTE
    ABSOLUTELY
    ACROSS
    ACTUAL
    ACTUALLY
    AFTER
    AFTERNOON
    AGAIN
    AGAINST
    AGO
    AGREE
    ALL
    ALMOST
    ALONG
    ALREADY
    ALTHOUGH
    ALWAYS
    AM
    AN
    AND
    ANOTHER
    ANY
    ANYHOW
    ANYTHING
    ANYWAY
    ARE
    AREN'T
    AROUND
    AS
    AT
    AWAY
    BACK
    BAD
    BE
    BEEN
    BEFORE
    BEHIND
    BEING
    BELIEVE
    BELONG
    BEST
    BETTER
    BETWEEN
    BIG
    BIGGER
    BIGGEST
    BIT
    BOTH
    BUDDY
    BUT
    BY
    CALL
    CALLED
    CALLING
    CAME
    CAN
    CAN'T
    CANNOT
    CARE
    CARING
    CASE
    CATCH
    CAUGHT
    CERTAIN
    CERTAINLY
    CHANGE
    CLOSE
    CLOSER
    COME
    COMING
    COMMON
    CONSTANT
    CONSTANTLY
    COULD
    CURRENT
    DAY
    DAYS
    DERIVED
    DESCRIBE
    DESCRIBES
    DETERMINE
    DETERMINES
    DID
    DIDN'T
    DO
    DOES
    DOESN'T
    DOING
    DON'T
    DONE
    DOUBT
    DOWN
    EACH
    EARLIER
    EARLY
    ELSE
    ENJOY
    ESPECIALLY
    EVEN
    EVER
    EVERY
    EVERYBODY
    EVERYONE
    EVERYTHING
    FACT
    FAIR
    FAIRLY
    FAR
    FELLOW
    FEW
    FIND
    FINE
    FOR
    FORM
    FOUND
    FROM
    FULL
    FURTHER
    GAVE
    GET
    GETTING
    GIVE
    GIVEN
    GIVING
    GO
    GOING
    GONE
    GOOD
    GOT
    GOTTEN
    GREAT
    HAD
    HAS
    HASN'T
    HAVE
    HAVEN'T
    HAVING
    HELD
    HERE
    HIGH
    HOLD
    HOLDING
    HOW
    IF
    IN
    INDEED
    INSIDE
    INSTEAD
    INTO
    IS
    ISN'T
    IT
    IT'S
    ITS
    JUST
    KEEP
    KIND
    KNEW
    KNOW
    KNOWN
    LARGE
    LARGER
    LARGETS
    LAST
    LATE
    LATER
    LEAST
    LESS
    LET
    LET'S
    LEVEL
    LIKES
    LITTLE
    LONG
    LONGER
    LOOK
    LOOKED
    LOOKING
    LOOKS
    LOW
    MADE
    MAKE
    MAKING
    MANY
    MATE
    MAY
    MAYBE
    MEAN
    MEET
    MENTION
    MERE
    MIGHT
    MOMENT
    MORE
    MORNING
    MOST
    MOVE
    MUCH
    MUST
    NEAR
    NEARER
    NEVER
    NEXT
    NICE
    NOBODY
    NONE
    NOON
    NOONE
    NOT
    NOTE
    NOTHING
    NOW
    OBVIOUS
    OF
    OFF
    ON
    ONCE
    ONLY
    ONTO
    OPINION
    OR
    OTHER
    OUR
    OUT
    OVER
    OWN
    PART
    PARTICULAR
    PARTICULARLY
    PERHAPS
    PERSON
    PIECE
    PLACE
    PLEASANT
    PLEASE
    POPULAR
    PREFER
    PRETTY
    PUT
    QUITE
    REAL
    REALLY
    RECEIVE
    RECEIVED
    RECENT
    RECENTLY
    RELATED
    RESULT
    RESULTING
    RESULTS
    SAID
    SAME
    SAW
    SAY
    SAYING
    SEE
    SEEM
    SEEMED
    SEEMS
    SEEN
    SELDOM
    SENSE
    SET
    SEVERAL
    SHALL
    SHORT
    SHORTER
    SHOULD
    SHOW
    SHOWS
    SIMPLE
    SIMPLY
    SMALL
    SO
    SOME
    SOMEONE
    SOMETHING
    SOMETIME
    SOMETIMES
    SOMEWHERE
    SORT
    SORTS
    SPEND
    SPENT
    STILL
    STUFF
    SUCH
    SUGGEST
    SUGGESTION
    SUPPOSE
    SURE
    SURELY
    SURROUND
    SURROUNDS
    TAKE
    TAKEN
    TAKING
    TELL
    THAN
    THANK
    THANKS
    THAT
    THAT'S
    THATS
    THE
    THEIR
    THEM
    THEN
    THERE
    THEREFORE
    THESE
    THEY
    THING
    THINGS
    THIS
    THOSE
    THOUGH
    THOUGHTS
    THOUROUGHLY
    THROUGH
    TINY
    TO
    TODAY
    TOGETHER
    TOLD
    TOMORROW
    TOO
    TOTAL
    TOTALLY
    TOUCH
    TRY
    TWICE
    UNDER
    UNDERSTAND
    UNDERSTOOD
    UNTIL
    UP
    US
    USED
    USING
    USUALLY
    VARIOUS
    VERY
    WANT
    WANTED
    WANTS
    WAS
    WATCH
    WAY
    WAYS
    WE
    WE'RE
    WELL
    WENT
    WERE
    WHAT
    WHAT'S
    WHATEVER
    WHATS
    WHEN
    WHERE
    WHERE'S
    WHICH
    WHILE
    WHILST
    WHO
    WHO'S
    WHOM
    WILL
    WISH
    WITH
    WITHIN
    WONDER
    WONDERFUL
    WORSE
    WORST
    WOULD
    WRONG
    YESTERDAY
    YET
  EOS
end
