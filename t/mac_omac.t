### BEWARE - GENERATED FILE, DO NOT EDIT MANUALLY!

use strict;
use warnings;

use Test::More;

use Crypt::Mac::OMAC qw( omac omac_hex omac_b64 );

is( unpack('H*', Crypt::Mac::OMAC->new('AES','1234567890123456')->add("")->mac), '0858f76009f57ad2c6fd771d1b93a21e', 'OMAC/oo+raw/1');
is( Crypt::Mac::OMAC->new('AES','1234567890123456')->add("")->hexmac, '0858f76009f57ad2c6fd771d1b93a21e', 'OMAC/oo+hex/1');
is( unpack('H*', omac('AES','1234567890123456',"")), '0858f76009f57ad2c6fd771d1b93a21e', 'OMAC/func+raw/1');
is( omac_hex('AES','1234567890123456',""), '0858f76009f57ad2c6fd771d1b93a21e', 'OMAC/func+hex/1');
is( omac_b64('AES','1234567890123456',""), 'CFj3YAn1etLG/XcdG5OiHg==', 'OMAC/func+b64/1');
is( unpack('H*', Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add("")->mac), '659fa9f016ce9b4a2bf9f5ec4486732b', 'OMAC/oo+raw/2');
is( Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add("")->hexmac, '659fa9f016ce9b4a2bf9f5ec4486732b', 'OMAC/oo+hex/2');
is( unpack('H*', omac('AES','12345678901234561234567890123456',"")), '659fa9f016ce9b4a2bf9f5ec4486732b', 'OMAC/func+raw/2');
is( omac_hex('AES','12345678901234561234567890123456',""), '659fa9f016ce9b4a2bf9f5ec4486732b', 'OMAC/func+hex/2');
is( omac_b64('AES','12345678901234561234567890123456',""), 'ZZ+p8BbOm0or+fXsRIZzKw==', 'OMAC/func+b64/2');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add("")->mac), 'a53ab7d313338f8f', 'OMAC/oo+raw/3');
is( Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add("")->hexmac, 'a53ab7d313338f8f', 'OMAC/oo+hex/3');
is( unpack('H*', omac('Blowfish','1234567890123456',"")), 'a53ab7d313338f8f', 'OMAC/func+raw/3');
is( omac_hex('Blowfish','1234567890123456',""), 'a53ab7d313338f8f', 'OMAC/func+hex/3');
is( omac_b64('Blowfish','1234567890123456',""), 'pTq30xMzj48=', 'OMAC/func+b64/3');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add("")->mac), 'a53ab7d313338f8f', 'OMAC/oo+raw/4');
is( Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add("")->hexmac, 'a53ab7d313338f8f', 'OMAC/oo+hex/4');
is( unpack('H*', omac('Blowfish','12345678901234561234567890123456',"")), 'a53ab7d313338f8f', 'OMAC/func+raw/4');
is( omac_hex('Blowfish','12345678901234561234567890123456',""), 'a53ab7d313338f8f', 'OMAC/func+hex/4');
is( omac_b64('Blowfish','12345678901234561234567890123456',""), 'pTq30xMzj48=', 'OMAC/func+b64/4');
is( unpack('H*', Crypt::Mac::OMAC->new('AES','1234567890123456')->add(123)->mac), 'cdda83e8105929d720615d2e2919f517', 'OMAC/oo+raw/5');
is( Crypt::Mac::OMAC->new('AES','1234567890123456')->add(123)->hexmac, 'cdda83e8105929d720615d2e2919f517', 'OMAC/oo+hex/5');
is( unpack('H*', omac('AES','1234567890123456',123)), 'cdda83e8105929d720615d2e2919f517', 'OMAC/func+raw/5');
is( omac_hex('AES','1234567890123456',123), 'cdda83e8105929d720615d2e2919f517', 'OMAC/func+hex/5');
is( omac_b64('AES','1234567890123456',123), 'zdqD6BBZKdcgYV0uKRn1Fw==', 'OMAC/func+b64/5');
is( unpack('H*', Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add(123)->mac), '93cfd941f83b842afe81326332f25e32', 'OMAC/oo+raw/6');
is( Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add(123)->hexmac, '93cfd941f83b842afe81326332f25e32', 'OMAC/oo+hex/6');
is( unpack('H*', omac('AES','12345678901234561234567890123456',123)), '93cfd941f83b842afe81326332f25e32', 'OMAC/func+raw/6');
is( omac_hex('AES','12345678901234561234567890123456',123), '93cfd941f83b842afe81326332f25e32', 'OMAC/func+hex/6');
is( omac_b64('AES','12345678901234561234567890123456',123), 'k8/ZQfg7hCr+gTJjMvJeMg==', 'OMAC/func+b64/6');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add(123)->mac), '357f9876a15825ec', 'OMAC/oo+raw/7');
is( Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add(123)->hexmac, '357f9876a15825ec', 'OMAC/oo+hex/7');
is( unpack('H*', omac('Blowfish','1234567890123456',123)), '357f9876a15825ec', 'OMAC/func+raw/7');
is( omac_hex('Blowfish','1234567890123456',123), '357f9876a15825ec', 'OMAC/func+hex/7');
is( omac_b64('Blowfish','1234567890123456',123), 'NX+YdqFYJew=', 'OMAC/func+b64/7');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add(123)->mac), '357f9876a15825ec', 'OMAC/oo+raw/8');
is( Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add(123)->hexmac, '357f9876a15825ec', 'OMAC/oo+hex/8');
is( unpack('H*', omac('Blowfish','12345678901234561234567890123456',123)), '357f9876a15825ec', 'OMAC/func+raw/8');
is( omac_hex('Blowfish','12345678901234561234567890123456',123), '357f9876a15825ec', 'OMAC/func+hex/8');
is( omac_b64('Blowfish','12345678901234561234567890123456',123), 'NX+YdqFYJew=', 'OMAC/func+b64/8');
is( unpack('H*', Crypt::Mac::OMAC->new('AES','1234567890123456')->add("test\0test\0test\n")->mac), '628848c1604f58010affc6ad6cf07135', 'OMAC/oo+raw/9');
is( Crypt::Mac::OMAC->new('AES','1234567890123456')->add("test\0test\0test\n")->hexmac, '628848c1604f58010affc6ad6cf07135', 'OMAC/oo+hex/9');
is( unpack('H*', omac('AES','1234567890123456',"test\0test\0test\n")), '628848c1604f58010affc6ad6cf07135', 'OMAC/func+raw/9');
is( omac_hex('AES','1234567890123456',"test\0test\0test\n"), '628848c1604f58010affc6ad6cf07135', 'OMAC/func+hex/9');
is( omac_b64('AES','1234567890123456',"test\0test\0test\n"), 'YohIwWBPWAEK/8atbPBxNQ==', 'OMAC/func+b64/9');
is( unpack('H*', Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add("test\0test\0test\n")->mac), '20d6c5cc640730d2b8bb9308031c000b', 'OMAC/oo+raw/10');
is( Crypt::Mac::OMAC->new('AES','12345678901234561234567890123456')->add("test\0test\0test\n")->hexmac, '20d6c5cc640730d2b8bb9308031c000b', 'OMAC/oo+hex/10');
is( unpack('H*', omac('AES','12345678901234561234567890123456',"test\0test\0test\n")), '20d6c5cc640730d2b8bb9308031c000b', 'OMAC/func+raw/10');
is( omac_hex('AES','12345678901234561234567890123456',"test\0test\0test\n"), '20d6c5cc640730d2b8bb9308031c000b', 'OMAC/func+hex/10');
is( omac_b64('AES','12345678901234561234567890123456',"test\0test\0test\n"), 'INbFzGQHMNK4u5MIAxwACw==', 'OMAC/func+b64/10');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add("test\0test\0test\n")->mac), '40e6d018b49ada77', 'OMAC/oo+raw/11');
is( Crypt::Mac::OMAC->new('Blowfish','1234567890123456')->add("test\0test\0test\n")->hexmac, '40e6d018b49ada77', 'OMAC/oo+hex/11');
is( unpack('H*', omac('Blowfish','1234567890123456',"test\0test\0test\n")), '40e6d018b49ada77', 'OMAC/func+raw/11');
is( omac_hex('Blowfish','1234567890123456',"test\0test\0test\n"), '40e6d018b49ada77', 'OMAC/func+hex/11');
is( omac_b64('Blowfish','1234567890123456',"test\0test\0test\n"), 'QObQGLSa2nc=', 'OMAC/func+b64/11');
is( unpack('H*', Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add("test\0test\0test\n")->mac), '40e6d018b49ada77', 'OMAC/oo+raw/12');
is( Crypt::Mac::OMAC->new('Blowfish','12345678901234561234567890123456')->add("test\0test\0test\n")->hexmac, '40e6d018b49ada77', 'OMAC/oo+hex/12');
is( unpack('H*', omac('Blowfish','12345678901234561234567890123456',"test\0test\0test\n")), '40e6d018b49ada77', 'OMAC/func+raw/12');
is( omac_hex('Blowfish','12345678901234561234567890123456',"test\0test\0test\n"), '40e6d018b49ada77', 'OMAC/func+hex/12');
is( omac_b64('Blowfish','12345678901234561234567890123456',"test\0test\0test\n"), 'QObQGLSa2nc=', 'OMAC/func+b64/12');

done_testing();
