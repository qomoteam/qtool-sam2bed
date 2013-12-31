while (<>)
{
	if (! /^@/)		
	{
		chomp($_);					# Delete newline at end of each line
        @fields=split /\t/;
        $start=$fields[3]-1;
        next if $start<0;
        $end=$start+length $fields[9];
        $chr=$fields[2];
        $name=$fields[0];
        $strand=$fields[1] & 0x10 ? '-' : '+';
        $score=(/NM:i:(\d+)/)? $1 : 0;
        $line = join("\t",($chr,$start,$end,$name,$score,$strand));
        print "$line\n"
	}
}
