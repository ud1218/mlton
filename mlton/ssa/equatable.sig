(* Copyright (C) 2004 Henry Cejtin, Matthew Fluet, Suresh
 *    Jagannathan, and Stephen Weeks.
 *
 * MLton is released under the GNU General Public License (GPL).
 * Please see the file MLton-LICENSE for license information.
 *)

(*
 * Equatable values can be equated, after which they are equals.  In equating
 * two value requires the client to specify how to compute the new value from
 * the old.
 *
 * Equatable values can be either created by "new" or "delay".  In the case of
 * delay, the value is only computed if "value" is called.
 *
 * Equating a value created by delay with a value created by new will completely
 * drop the delayed value.  Hence, if a value is delayed, then nothing should
 * be assumed about any of its subcomponents. 
 *)

signature EQUATABLE =
   sig
      type 'a t

      val equals: 'a t * 'a t -> bool
      val delay: (unit -> 'a) -> 'a t
      val equate: 'a t * 'a t * ('a * 'a -> 'a) -> unit
      val layout: ('a -> Layout.t) -> 'a t -> Layout.t
      val new: 'a -> 'a t
      val value: 'a t -> 'a
   end
