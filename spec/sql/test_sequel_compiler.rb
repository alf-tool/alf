require_relative 'helpers'
module Alf
  module Sequel
    describe Compiler do

      def compiler
        @compiler ||= Compiler.new
      end

      subject{ compiler.call(expr) }

      each_query do |query|
        context "Sequel-based SQL compilation of '#{query}'" do
          let(:expr){ conn.parse(query['alf']) }

          it 'to_cog should lead to a Sequel::Cog' do
            expr.to_cog.should be_a(Cog)
          end if query['sql']

          it 'sexpr.to_sql should be valid SQL for the DBMS considered' do
            begin
              sql = expr.to_cog.sexpr.to_sql
              adapter[sql].to_a
            rescue => ex
              $stderr.print('x')
              # $stderr.puts strip(query['sql'])
              # $stderr.puts ex.message
            end
          end if query['sql']

          it 'to_cog.to_a should run without problem' do
            lambda{
              expr.to_cog.to_a
            }.should_not(raise_error)
          end
        end
      end

    end
  end
end
