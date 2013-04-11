package Crypt::Cipher::DES_EDE;

### BEWARE - GENERATED FILE, DO NOT EDIT MANUALLY!

use strict;
use warnings;

use CryptX;
use base 'Crypt::Cipher';

sub blocksize      { Crypt::Cipher::blocksize(__PACKAGE__) }
sub keysize        { Crypt::Cipher::keysize(__PACKAGE__) }
sub max_keysize    { Crypt::Cipher::max_keysize(__PACKAGE__) }
sub min_keysize    { Crypt::Cipher::min_keysize(__PACKAGE__) }
sub default_rounds { Crypt::Cipher::default_rounds(__PACKAGE__) }

1;

=pod

=head1 NAME

Crypt::Cipher::DES_EDE - Symetric cipher DES_EDE (aka Tripple-DES, 3DES), key size: 192[168] bits (Crypt::CBC compliant)

=head1 SYNOPSIS

  use Crypt::CBC;
  use Crypt::Cipher::DES_EDE;
  
  my $key = '...'; # length has to be valid key size for this cipher
  my $cipher = Crypt::Cipher::DES_EDE->new($key);
  my $cbc = Crypt::CBC->new( -cipher=>$cipher );
  my $ciphertext = $cbc->encrypt("secret data");

=head1 DESCRIPTION

This module implements the DES_EDE cipher. Provided interface is compliant with L<Crypt::CBC|Crypt::CBC> module.

B<BEWARE:> This module implements just elementary "one-block-(en|de)cryption" operation - if you want to
encrypt/decrypt generic data you have to use some of the cipher block modes - check for example
L<Crypt::CBC|Crypt::CBC>.

=head1 METHODS

The OO interface provides the same set of functions as L<Crypt::Cipher>.

=head2 new

 $c = Crypt::Cipher::DES_EDE->new($key);
 #or
 $c = Crypt::Cipher::DES_EDE->new($key, $rounds);

=head2 encrypt

 $ciphertext = $c->encrypt($plaintext);

=head2 decrypt

 $plaintext = $c->decrypt($ciphertext);

=head2 keysize

  $c->keysize;
  #or
  Crypt::Cipher::DES_EDE->keysize;
  #or
  Crypt::Cipher::DES_EDE::keysize;

=head2 blocksize

  $c->blocksize;
  #or
  Crypt::Cipher::DES_EDE->blocksize;
  #or
  Crypt::Cipher::DES_EDE::blocksize;

=head2 max_keysize

  $c->max_keysize;
  #or
  Crypt::Cipher::DES_EDE->max_keysize;
  #or
  Crypt::Cipher::DES_EDE::max_keysize;

=head2 min_keysize

  $c->min_keysize;
  #or
  Crypt::Cipher::DES_EDE->min_keysize;
  #or
  Crypt::Cipher::DES_EDE::min_keysize;

=head2 default_rounds

  $c->default_rounds;
  #or
  Crypt::Cipher::DES_EDE->default_rounds;
  #or
  Crypt::Cipher::DES_EDE::default_rounds;

=head1 SEE ALSO

=over 4

=item L<CryptX|CryptX>, L<Crypt::Cipher|Crypt::Cipher>

=item L<http://en.wikipedia.org/wiki/Triple_DES|http://en.wikipedia.org/wiki/Triple_DES>

=back

=cut

__END__