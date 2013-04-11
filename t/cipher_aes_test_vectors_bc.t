use strict;
use warnings;

use Test::More tests => 25;
use Crypt::Cipher::AES;

ok(1);

my $line = 1;
while (my $l = <DATA>) {
  chomp($l);
  $l =~ s/[\s\t]+/ /g;
  my $d = {};
  for my $pair (split / /, $l) {
    my ($k, $v) = split /:/, $pair;
    $d->{$k} = $v;
  }
  
  my $c = Crypt::Cipher::AES->new(pack('H*',$d->{key}));
  my $result = pack('H*', $d->{pt});
  $result = $c->encrypt($result) for(1..$d->{iter});
  is(unpack('H*', $result), lc($d->{ct}), "line=$line");
  $line++;
}

__DATA__
iter:1 key:80000000000000000000000000000000 pt:00000000000000000000000000000000 ct:0EDD33D3C621E546455BD8BA1418BEC8
iter:1 key:00000000000000000000000000000080 pt:00000000000000000000000000000000 ct:172AEAB3D507678ECAF455C12587ADB7
iter:1 key:000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:6CD02513E8D4DC986B4AFE087A60BD0C
iter:1 key:0000000000000000000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:DDC6BF790C15760D8D9AEB6F9A75FD4E
iter:1 key:80000000000000000000000000000000 pt:00000000000000000000000000000000 ct:0EDD33D3C621E546455BD8BA1418BEC8
iter:1 key:00000000000000000000000000000080 pt:00000000000000000000000000000000 ct:172AEAB3D507678ECAF455C12587ADB7
iter:1 key:000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:6CD02513E8D4DC986B4AFE087A60BD0C
iter:1 key:0000000000000000000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:DDC6BF790C15760D8D9AEB6F9A75FD4E
iter:1 key:80000000000000000000000000000000 pt:00000000000000000000000000000000 ct:0EDD33D3C621E546455BD8BA1418BEC8
iter:1 key:00000000000000000000000000000080 pt:00000000000000000000000000000000 ct:172AEAB3D507678ECAF455C12587ADB7
iter:1 key:000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:6CD02513E8D4DC986B4AFE087A60BD0C
iter:1 key:0000000000000000000000000000000000000000000000000000000000000000 pt:80000000000000000000000000000000 ct:DDC6BF790C15760D8D9AEB6F9A75FD4E
iter:10000 key:00000000000000000000000000000000 pt:00000000000000000000000000000000 ct:C34C052CC0DA8D73451AFE5F03BE297F
iter:10000 key:5F060D3716B345C253F6749ABAC10917 pt:355F697E8B868B65B25A04E18D782AFA ct:ACC863637868E3E068D2FD6E3508454A
iter:10000 key:AAFE47EE82411A2BF3F6752AE8D7831138F041560631B114 pt:F3F6752AE8D7831138F041560631B114 ct:77BA00ED5412DFF27C8ED91F3C376172
iter:10000 key:28E79E2AFC5F7745FCCABE2F6257C2EF4C4EDFB37324814ED4137C288711A386 pt:C737317FE0846F132B23C8C2A672CE22 ct:E58B82BFBA53C0040DC610C642121168
iter:10000 key:00000000000000000000000000000000 pt:00000000000000000000000000000000 ct:C34C052CC0DA8D73451AFE5F03BE297F
iter:10000 key:5F060D3716B345C253F6749ABAC10917 pt:355F697E8B868B65B25A04E18D782AFA ct:ACC863637868E3E068D2FD6E3508454A
iter:10000 key:AAFE47EE82411A2BF3F6752AE8D7831138F041560631B114 pt:F3F6752AE8D7831138F041560631B114 ct:77BA00ED5412DFF27C8ED91F3C376172
iter:10000 key:28E79E2AFC5F7745FCCABE2F6257C2EF4C4EDFB37324814ED4137C288711A386 pt:C737317FE0846F132B23C8C2A672CE22 ct:E58B82BFBA53C0040DC610C642121168
iter:10000 key:00000000000000000000000000000000 pt:00000000000000000000000000000000 ct:C34C052CC0DA8D73451AFE5F03BE297F
iter:10000 key:5F060D3716B345C253F6749ABAC10917 pt:355F697E8B868B65B25A04E18D782AFA ct:ACC863637868E3E068D2FD6E3508454A
iter:10000 key:AAFE47EE82411A2BF3F6752AE8D7831138F041560631B114 pt:F3F6752AE8D7831138F041560631B114 ct:77BA00ED5412DFF27C8ED91F3C376172
iter:10000 key:28E79E2AFC5F7745FCCABE2F6257C2EF4C4EDFB37324814ED4137C288711A386 pt:C737317FE0846F132B23C8C2A672CE22 ct:E58B82BFBA53C0040DC610C642121168
