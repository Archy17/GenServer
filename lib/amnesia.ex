defmodule Amn do


  def create_database do
    :mnesia.create_schema([node()])#создаем БД,в рабочем кат.
                                  #появится папка Mnesia.nonode@nohost
                                  #в этом каталоге созд файл schema.DAT
    :mnesia.create_table(:p_players,[{:disc_copies,[node()]},{:attributes,[:nikname, :name, :age, :games, :wins]}])
  end

  def start_database do
    :mnesia.start()
  end

  def wr_database do
  :mnesia.transaction(fn ->
    :mnesia.write({:p_players, "hat", "Bill Smith", "45", 100, 40})
    :mnesia.write({:p_players, "bell", "Ann Pirson", "20", 10, 3})
    :mnesia.write({:p_players, "Rat", "Den Konnie", "45", 75, 37})
  end)
  end

  def rd_database(nik) do
  #  try do
    {:atomic, [record]} = :mnesia.transaction(fn ->
  :mnesia.read({:p_players, nik}) end)
  #  rescue
  #    error -> error
  #  end
  end

  def stop_database do
    :mnesia.stop()
  end
end
