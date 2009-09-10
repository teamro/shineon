namespace ShineOn.Rtl;

{ *********************************************************************** }
{                                                                         }
{ Based on the Delphi Visual Component Library                            }
{                                                                         }
{ Copyright (c) CodeGear and RemObjects Software                          }
{                                                                         }
{ *********************************************************************** }

interface

uses
  System.Runtime.InteropServices;

{ IReadWriteSync is an abstract interface for general read/write synchronization.
  Some implementations may allow simultaneous readers, but writers always have
  exclusive locks. Worst case is that this class behaves identical to a TRTLCriticalSection -
  that is, read and write locks block all other threads. }

type
  [Guid('7B108C52-1D8F-4CDB-9CDF-57E071193D3F')]
  IReadWriteSync = interface
    method BeginRead;
    method EndRead;
    method BeginWrite: Boolean;
    method EndWrite;
  end;

{ TMultiReadExclusiveWriteSynchronizer minimizes thread serialization to gain
  read access to a resource shared among threads while still providing complete
  exclusivity to callers needing write access to the shared resource.
  (multithread shared reads, single thread exclusive write)
  Read locks are allowed while owning a write lock.
  Read locks can be promoted to write locks within the same thread.
  (BeginRead, BeginWrite, EndWrite, EndRead)

  Note: Other threads have an opportunity to modify the protected resource
  when you call BeginWrite before you are granted the write lock, even
  if you already have a read lock open.  Best policy is not to retain
  any info about the protected resource (such as count or size) across a
  write lock.  Always reacquire samples of the protected resource after
  acquiring or releasing a write lock.

  The function result of BeginWrite indicates whether another thread got
  the write lock while the current thread was waiting for the write lock.
  Return value of True means that the write lock was acquired without
  any intervening modifications by other threads.  Return value of False
  means another thread got the write lock while you were waiting, so the
  resource protected by the MREWS object should be considered modified.
  Any samples of the protected resource should be discarded.

  In general, it's better to just always reacquire samples of the protected
  resource after obtaining a write lock.  The boolean result of BeginWrite
  and the RevisionLevel property help cases where reacquiring the samples
  is computationally expensive or time consuming.

  RevisionLevel changes each time a write lock is granted.  You can test
  RevisionLevel for equality with a previously sampled value of the property
  to determine if a write lock has been granted, implying that the protected
  resource may be changed from its state when the original RevisionLevel
  value was sampled.  Do not rely on the sequentiality of the current
  RevisionLevel implementation (it will wrap around to zero when it tops out).
  Do not perform greater than / less than comparisons on RevisionLevel values.
  RevisionLevel indicates only the stability of the protected resource since
  your original sample.  It should not be used to calculate how many
  revisions have been made.
}

{$IFNDEF CF}
type
  TMultiReadExclusiveWriteSynchronizer = class(TInterfacedObject, IReadWriteSync)
  private
    FReaderWriterLock: System.Threading.ReaderWriterLock;
    method GetRevisionLevel: Integer;
  public
    constructor Create;

    method BeginRead;
    method EndRead;
    method BeginWrite: Boolean;
    method EndWrite;

    {! RevisionLevel used to be Cardinal in DCC32 }
    property RevisionLevel: Integer read GetRevisionLevel;
  end;

  // short form
  TMREWSync = TMultiReadExclusiveWriteSynchronizer;
{$ENDIF}
  
implementation

{$IFNDEF CF}
constructor TMultiReadExclusiveWriteSynchronizer.Create;
begin
  inherited;
  FReaderWriterLock := System.Threading.ReaderWriterLock.Create;
end;

method TMultiReadExclusiveWriteSynchronizer.GetRevisionLevel: Integer;
begin
  Result := FReaderWriterLock.WriterSeqNum;
end;

method TMultiReadExclusiveWriteSynchronizer.BeginRead;
begin
  FReaderWriterLock.AcquireReaderLock(-1);
end;

method TMultiReadExclusiveWriteSynchronizer.EndRead;
begin
  FReaderWriterLock.ReleaseReaderLock;
end;

method TMultiReadExclusiveWriteSynchronizer.BeginWrite: Boolean;
begin
  FReaderWriterLock.AcquireWriterLock(-1);
  Result := FReaderWriterLock.IsWriterLockHeld;
end;

method TMultiReadExclusiveWriteSynchronizer.EndWrite;
begin
  FReaderWriterLock.ReleaseWriterLock;
end;
{$ENDIF}
end.